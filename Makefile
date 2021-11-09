inputs = $(wildcard src/*.java)
outputs = $(patsubst src/%.java, bin/%.class,$(inputs))

bin/%.class: src/%.java
	@echo -e "\e[1m[\e[33;1mCOMPILE\e[0m\e[1m]: \e[33;1mCompiling\e[0m \e[4m"$@"\e[0m \e[1mfrom\e[0m \e[4m"$<"\e[0m \e[1m...\e[0m"
	@javac -sourcepath src $< -d bin

default: $(outputs)
	@echo -e "\e[1m[\e[32;1mSTOPPED\e[0m\e[1m]: \e[32;1mCompleted\e[0m\e[1m the compilation!\e[0m"

exec: default
	@java -cp bin Main

clean:
	@echo -e "\e[1m[\e[36;1mCLEANED\e[0m\e[1m]: \e[36;1mCleaning\e[0m\e[1m compiled \e[0m\e[4m.class\e[0m\e[1m files ...\e[0m"
	@rm bin/*