SCALAC = scalac
SCALA = scala

all: compile run

compile:
	$(SCALAC) triangleArea.scala
	$(SCALAC) isLeap.scala
	$(SCALAC) ageXmas2023.scala
	$(SCALAC) main.scala

run:
	$(SCALA) Main

clean:
	rm -f *.class

.PHONY: all compile run clean