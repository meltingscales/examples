# Setup:

## Notes

This is a relatively old and unorganized repo. Some of these examples may use the Pipfile in this folder, and some are nested, so the steps below may need to be modified slightly.

## Links

https://www.python.org/downloads/

https://pypi.org/project/pip/

https://pipenv.pypa.io/en/latest/

## Steps

1. 	Install Python >=3.6
2.	In this directory, run `pip install pipenv`.
3.  	In this directory, run `pipenv install`.
	- This will install all required deps from a file called `Pipfile`.
	- Feel free to open `Pipfile` to see what goofy libs I'm forcing you to 
		download.
4. 	To run a python script properly with Pipenv, use `pipenv run python myfile.py`.
