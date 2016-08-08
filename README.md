Objective-Cのファイル依存関係を解析するrubyスクリプトです。
スクリプトはdotファイルに変換されます。dotファイルはgraphvizでグラフィカルに表示することができます。
複雑な既存コードにおおよそのあたりをつけたり、リファクタリングの目安としてお使いいただければ幸いです。

This ruby script to parse the file dependencies of Objective-C.
Script is converted to dot file. dot file can be displayed graphically in graphviz.
You put a hit of roughly complex existing code, we hope you'll use it as a measure of refactoring.




This script parses the dependencies between the Objective C file .
Dot format of the file is output when you run the script .


ruby kaiseki.rb ./../hoge/ > c.dot

dot -Tgif c.dot -o c.gif
