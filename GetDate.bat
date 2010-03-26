:: This script outputs the current date in the format required for files.sql.
:: Default output of "date /t" is 27.03.2010, which is converted to 2010-03-27
:: Tools required: sed
date /t | sed -e "s/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)/\3-\2-\1/"
:: RegExplanation:
:: \([0-9]*\) - first block of digits (\1)
:: \. - mandatory dot
:: \([0-9]*\) - second block of digits (\2)
:: \. - mandatory dot
:: \([0-9]*\) - third block of digits (\3)
