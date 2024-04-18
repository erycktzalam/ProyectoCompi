SET JAVA_HOME="C:\Users\Eryyc\Documents\NetBeansJDKs\openjdk-17.0.2_windows-x64_bin\jdk-17.0.2\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd C:\Users\Eryyc\OneDrive\Documentos\Compiladores\CalcJFlexCup\src\Analizadores
java -jar C:\Users\Eryyc\Documents\Fuentes\java-cup-11b.jar -parser Parser -symbols ParserSym -debug Sintactico.cup
pause
