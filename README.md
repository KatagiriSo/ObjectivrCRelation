This script parses the dependencies between the Objective C file .

Dot format of the file is output when you run the script .



ruby kaiseki.rb ./../hoge/ > c.dot

dot -Tgif c.dot -o c.gif
