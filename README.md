# spice-platform

All spice services in repository

## Requirements
1. [Docker](https://docs.docker.com/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)

## How to run it?

1. Clone the repository:
```
$ git clone https://github.com/spiceitup/spice-platform.git --recursive --jobs 3
```

3. Go to the cloned directory:
```
$ cd spice-platform
```

4. Build the application:
```
$ docker-compose build
```

5. Apply Django migrations:
```
$ docker-compose run --rm api python3 manage.py migrate
```

6. Collect static files:
```
$ docker-compose run --rm api python3 manage.py collectstatic --noinput
```

7. Run the application:
```
$ docker-compose up
```
