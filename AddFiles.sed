# The "commit;" line is the last one in the files.sql, so we replace it with
# the new entries read from files.txt.
/commit;/ { # when the "commit;" line is reached, do the following:
   # paste contents of the file "files.txt"
   r files.txt
   # append the text "commit;"
   a commit;
   # delete the original "commit;" line, otherwise it'll be before the pasted file
   d
}
