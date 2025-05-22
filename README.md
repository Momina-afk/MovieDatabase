🎬 MovieDatabase
Welcome to MovieDB, a full-stack movie database web app built for a university DBMS project. It combines a powerful MySQL database with a smart Python Flask backend and a responsive HTML/CSS frontend.
🌟 Features

✅ User Login & Signup  
✅ Movie Search & Reviews  
✅ Personalized Recommendations  
✅ Trending Page (Ratings + Box Office)  
✅ Detailed Movie Info (Genres, Cast, Awards)  
✅ Director, Writer, and Actor Profiles  
✅ Platform-based Filtering (Netflix, Prime, etc.)  
✅ Award System for Movies, Actors, Directors  

📸 Screenshots

🎬 Dashboard
[Dashboard](screenshots/dashboard.png)

🎯 Recommendations
[Recommendations](screenshots/recommendations.png)

📖 Movie Detail
[Movie Detail](screenshots/movie_detail.png)

👨‍🎤 Director/Actor Page
[Director](screenshots/director.png)

🏗️ Tech Stack

| Layer        | Technology |
|--------------|------------|
| Backend      | Python 3, Flask |
| Frontend     | HTML, CSS, Jinja2 |
| Database     | MySQL |
| Styling      | Vanilla CSS |
| Deployment   | Localhost (Flask dev server) |

🧠 How It Works

This project uses raw SQL + Flask + Jinja2 to build smart logic:

- Movie data is stored in a relational database with 16+ tables
- Flask handles routes like `/login`, `/recommendations`, `/movie/<id>`
- Jinja templates render dynamic content using data from SQL
- Reviews and genres power recommendation engine
- Awards and streaming platforms are all fully linked

🔧 Setup Instructions (Run Locally)

🔁 Step 1: Clone the Repository

bash
git clone https://github.com/Momina-afk/MovieDatabase.git
cd movie-db-app

🗃️ Step 2: Setup the MySQL Database
SOURCE schema.sql;
SOURCE insertion_of_data.sql;

📦 Step 3: Install Dependencies
pip install flask
pip install mysql-connector-python

🚀 Step 4: Start the Flask Server
python app.py

Now open your browser and go to:
http://localhost:5000

📂 Project Structure
movie-db-app/
│
├── app.py                       # Main Flask backend
├── db.py,config.py,db_congig.py # Database connection
├── templates/                   # All HTML templates
├── static/
│   ├── posters/                 # Place movie posters here as movie_id.jpg
│   └── style.css                # Website styling
├── schema.sql                   # Table creation script
├── insertion_of_data.sql        # Realistic movie data
├── README.md                    # This file
├── screenshots/                 #shows running of program

🔒 Important Notes
Replace 'your_password' in config.py and db_config.py with your MySQL password

📄 License
This project is licensed under the [MIT License].

