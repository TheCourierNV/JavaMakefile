inputs = $(wildcard ../src/*.java)
outputs = $(patsubst ../src/%.java, ../bin/%.class,$(inputs))

../bin/%.class: ../src/%.java
	@echo -e "\e[1m[\e[33mCOMPILE\e[0;1m]: \e[33mCompiling\e[0m \e[4m"$@"\e[0m \e[1mfrom\e[0m \e[4m"$<"\e[0m \e[1m...\e[0m"
	@javac -sourcepath ../src $< -d ../bin

default: $(outputs)
	@echo -e "\e[1m[\e[32mSTOPPED\e[0;1m]: \e[32;1mCompleted\e[0;1m the compilation!\e[0m"

exec: default
	@java -cp ../bin Main

clean:
	@echo -e "\e[1m[\e[36mCLEANED\e[0;1m]: \e[36mCleaning\e[0;1m compiled \e[0;4m.class\e[0;1m files ...\e[0m"
	@rm ../bin/*.class