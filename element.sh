#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    CONDITION="elements.atomic_number = $1"
  elif [[ ${#1} -le 2 ]]
  then
    CONDITION="elements.symbol = '$1'"
  else
    CONDITION="elements.name = '$1'"
  fi

  
  ELEMENT_INFO=$($PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE $CONDITION")

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_INFO" | while IFS="|" read atomic_number name symbol type atomic_mass melting_point_celsius boiling_point_celsius
    do
      echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
    done
  fi
fi

# comment 1
# comment 2
# comment 3
# comment 4
