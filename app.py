# app.py
from flask import Flask, render_template, request, redirect, session, url_for
from db import get_connection

app = Flask(__name__)
app.secret_key = 'mysecretkey'  # For session

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM User WHERE name = %s AND email = %s", (name, email))
        user = cursor.fetchone()
        cursor.close()
        conn.close()
        if user:
            session['user'] = user
            return redirect(url_for('dashboard'))
        else:
            error = 'Wrong name or email. Try again.'
    return render_template('login.html', error=error)

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        sub_type = request.form['subscription_type']
        join_date = request.form['join_date']
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO User (name, email, join_date, subscription_type) VALUES (%s, %s, %s, %s)",
                       (name, email, join_date, sub_type))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect(url_for('login'))
    return render_template('signup.html')

@app.route('/dashboard')
def dashboard():
    if 'user' not in session:
        return redirect(url_for('login'))
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    search = request.args.get('search')
    if search:
        cursor.execute("SELECT * FROM Movie WHERE title LIKE %s", (f"%{search}%",))
    else:
        cursor.execute("SELECT * FROM Movie")
    movies = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('dashboard.html', movies=movies, user=session['user'])

@app.route('/movie/<int:movie_id>')
def movie_detail(movie_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Get movie info
    cursor.execute("SELECT * FROM Movie WHERE movie_id = %s", (movie_id,))
    movie = cursor.fetchone()
# Get genres for this movie
    cursor.execute("""
      SELECT g.name
      FROM Genre g
      JOIN Movie_Genre mg ON g.genre_id = mg.genre_id
      WHERE mg.movie_id = %s
      """, (movie_id,))
    genres = [row['name'] for row in cursor.fetchall()]

      
    # Get actors
    cursor.execute("""
      SELECT a.actor_id, a.name, c.character_name
      FROM Cast c
      JOIN Actor a ON c.actor_id = a.actor_id
     WHERE c.movie_id = %s
     """, (movie_id,))
    actors = cursor.fetchall()


    # Get reviews
    cursor.execute("""
        SELECT u.name, r.comment, r.rating FROM Review r
        JOIN User u ON r.user_id = u.user_id
        WHERE r.movie_id = %s
    """, (movie_id,))
    reviews = cursor.fetchall()
    cursor.execute("""
        SELECT a.name, a.year
        FROM MovieAward ma
        JOIN Award a ON ma.award_id = a.award_id
        WHERE ma.movie_id = %s
    """, (movie_id,))
    awards = cursor.fetchall()

    cursor.close()
    conn.close()
    #return render_template('movie_detail.html', movie=movie, actors=actors, reviews=reviews, awards=awards)
    return render_template('movie_detail.html',movie=movie,actors=actors,reviews=reviews,awards=awards,genres=genres)


@app.route('/review', methods=['POST'])
def add_review():
    if 'user' not in session:
        return redirect(url_for('login'))
    user_id = session['user']['user_id']
    movie_id = request.form['movie_id']
    rating = request.form['rating']
    comment = request.form['comment']
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Review (user_id, movie_id, rating, comment, review_date) VALUES (%s, %s, %s, %s, CURDATE())",
                   (user_id, movie_id, rating, comment))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('movie_detail', movie_id=movie_id))

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))
@app.route('/trending')
def trending():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
        SELECT m.movie_id, m.title, b.total_revenue, ROUND(AVG(r.rating), 1) AS avg_rating
        FROM Movie m
        JOIN BoxOfficeReport b ON m.box_office_id = b.box_office_id
        JOIN Review r ON m.movie_id = r.movie_id
        GROUP BY m.movie_id
        ORDER BY b.total_revenue DESC, avg_rating DESC
        LIMIT 5;
    """
    cursor.execute(query)
    trending_movies = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('trending.html', movies=trending_movies)

@app.route('/recommendations')
def recommendations():
    if 'user' not in session:
        return redirect(url_for('login'))
    
    user_id = session['user']['user_id']
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT DISTINCT m.movie_id, m.title, m.rating, m.release_date
        FROM Movie m
        JOIN Movie_Genre mg ON m.movie_id = mg.movie_id
        JOIN Genre g ON mg.genre_id = g.genre_id
        WHERE mg.genre_id IN (
            SELECT mg2.genre_id
            FROM Review r
            JOIN Movie m2 ON r.movie_id = m2.movie_id
            JOIN Movie_Genre mg2 ON m2.movie_id = mg2.movie_id
            WHERE r.user_id = %s
            GROUP BY mg2.genre_id
            HAVING AVG(r.rating) >= 4.0
        )
        AND m.movie_id NOT IN (
            SELECT movie_id FROM Review WHERE user_id = %s
        )
        LIMIT 10;
    """
    cursor.execute(query, (user_id, user_id))
    recs = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('recommendations.html', movies=recs)

@app.route('/director/<int:director_id>')
def director_page(director_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Get director info
    cursor.execute("SELECT * FROM Director WHERE director_id = %s", (director_id,))
    director = cursor.fetchone()

    # Get movies by director
    cursor.execute("""
        SELECT movie_id, title, release_date, rating
        FROM Movie
        WHERE director_id = %s
    """, (director_id,))
    movies = cursor.fetchall()

    # Get awards
    cursor.execute("""
        SELECT a.name, a.year
        FROM DirectorAward da
        JOIN Award a ON da.award_id = a.award_id
        WHERE da.director_id = %s
    """, (director_id,))
    awards = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('director.html', director=director, movies=movies, awards=awards)
@app.route('/writer/<int:writer_id>')
def writer_page(writer_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Writer Info
    cursor.execute("SELECT * FROM Writer WHERE writer_id = %s", (writer_id,))
    writer = cursor.fetchone()

    # Scripts by this writer
    cursor.execute("""
        SELECT s.script_id, s.title, s.language, m.movie_id, m.title AS movie_title, d.name AS director_name
        FROM Script s
        LEFT JOIN Movie m ON s.script_id = m.script_id
        LEFT JOIN Director d ON m.director_id = d.director_id
        WHERE s.writer_id = %s
    """, (writer_id,))
    scripts = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('writer.html', writer=writer, scripts=scripts)

@app.route('/platform/<int:platform_id>')
def platform_page(platform_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Get platform info
    cursor.execute("SELECT * FROM Platform WHERE platform_id = %s", (platform_id,))
    platform = cursor.fetchone()

    # Get movies on that platform
    cursor.execute("""
        SELECT m.movie_id, m.title, m.release_date, m.rating, c.streams, c.available_from
        FROM ContentDistribution c
        JOIN Movie m ON c.movie_id = m.movie_id
        WHERE c.platform_id = %s
    """, (platform_id,))
    movies = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('platform.html', platform=platform, movies=movies)
@app.route('/actor/<int:actor_id>')
def actor_page(actor_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Actor Info
    cursor.execute("SELECT * FROM Actor WHERE actor_id = %s", (actor_id,))
    actor = cursor.fetchone()

    # Awards
    cursor.execute("""
        SELECT a.name, a.year
        FROM ActorAward aa
        JOIN Award a ON aa.award_id = a.award_id
        WHERE aa.actor_id = %s
    """, (actor_id,))
    awards = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('actor.html', actor=actor, awards=awards)


if __name__ == '__main__':
    app.run(debug=True)
