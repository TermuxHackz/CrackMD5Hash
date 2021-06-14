#!/bin/bash
# Md5Crack - Script to hash md5 decryption
# Description:  CrackMD5Hash is a script used to Decrypt MD5 hashes via a wordlist dictionary
# Use         : ./crackhash.sh [wordlist] [hash]
# Developer   : AnonyminHack5
# Email       : AnonyminHack5@protonmail.com

if [ -f "$1" ] && [ -n "$2" ] && [ ${#2} == 32 ] 
then # Checks whether the file exists and is not a directory, if the hash has been passed and if it has 32 characters
  banner() {
  	printf "\e[1;37m__  _______  ____________                __              \e[0m\n"
      printf "\e[1;37m/  |/  / __ \/ ____/ ____/________ ______/ /_____  _____ \e[0m\n"
      printf "\e[1;37m/ /|_/ / / / /___ \/ /   / ___/ __  / ___/ //_/ _ \/ ___/ \e[0m\n"
      printf "\e[1;37m/ /  / / /_/ /___/ / /___/ /  / /_/ / /__/ ,< /  __/ /     \e[0m\n"
      printf "\e[1;37m/_/  /_/_____/_____/\____/_/   \__,_/\___/_/|_|\___/_/     \e[0m\n"
      printf ""
      printf "\n"
      printf "\e[1;34m_______________________________________________\e[0m\n"
      printf "\n"
      printf "\e[1;36mAuthor: AnonyminHack5\e[0m\n"
      printf "\e[1;36mGithub: TermuxHackz\e[0m\n"
      printf "\e[1;34m_______________________________________________\e[0m\n"
      printf "CrackHash is a script used to decrypt MD5 hashes via a wordlist dictionary\e[0m\n"
      printf ""
      }
      banner
  cont=0
  for line in $(cat $1); do    
    v=$line
    hash="$(echo -n "$v" | md5sum | sed 's/ //g' | sed 's/-//g')"; # Encrypts and treats wordlist password
    if [ $hash = $2 ] # Checks if password is found
    then
      echo ""
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[46;1;37m| MD5 hash successfully deciphied ===> :\033[0m " $v
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[44;1;37m| Passwords that were tested: $cont\033[0m"
      exit 1
    else
      let cont=$cont+1;
      # Shows the script flow in operation
      echo -e "[ \033[31mFAILED\033[0m ] \033[1;32m$hash\033[0m != \033[1;32m$2\033[0m ($line)"
    fi
  done
else
  clear # Cleaning the terminal from the nonsense you did 
  banner() {
  	printf "\e[1;37m__  _______  ____________                __              \e[0m\n"
      printf "\e[1;37m/  |/  / __ \/ ____/ ____/________ ______/ /_____  _____ \e[0m\n"
      printf "\e[1;37m/ /|_/ / / / /___ \/ /   / ___/ __  / ___/ //_/ _ \/ ___/ \e[0m\n"
      printf "\e[1;37m/ /  / / /_/ /___/ / /___/ /  / /_/ / /__/ ,< /  __/ /     \e[0m\n"
      printf "\e[1;37m/_/  /_/_____/_____/\____/_/   \__,_/\___/_/|_|\___/_/     \e[0m\n"
      printf ""
      printf "\n"
      printf "\e[1;34m_______________________________________________\e[0m\n"
      printf "\n"
      printf "\e[1;36mAuthor: AnonyminHack5\e[0m\n"
      printf "\e[1;36mGithub: TermuxHackz\e[0m\n"
      printf "\e[1;34m_______________________________________________\e[0m\n"
      printf "CrackHash is a script used to decrypt MD5 hashes via a wordlist dictionary\e[0m\n"
      printf ""
      }
      banner
      echo ""
  echo "HELP MENU! : "
  echo ""
  echo -e "\033[1;34mUsage [Termux]:\033[0m \033[1;32mbash crackhash.sh [wordlist] [hash]\033[0m"
  echo -e "\033[1;34mUsage [Linux]:\033[0m \033[1;32m./crackhash.sh [wordlist] [hash]\033[0m" 
  echo ""
  echo "   [FILE] : wordlist location passwords"
  echo "   [HASH] : MD5 hash to be decrypted"
  echo ""
  echo -e "\e[1;37m Coded By: AnonyminHack5\e[0m"
fi