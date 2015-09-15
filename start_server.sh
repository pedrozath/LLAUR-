export $(heroku config --shell)
export EMAIL_RECEIVER=pedrozath@gmail.com
export FRONT_PHOTOS_IDS=20
unset DATABASE_URL
foreman start -p 3000