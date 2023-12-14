#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  INT_QUERRY=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  SYMBOL_QUERRY=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
  NAME_QUERRY=$($PSQL "SELECT * FROM elements WHERE name='$1'")
  if [[ -z $INT_QUERRY && -z $SYMBOL_QUERRY && -z $NAME_QUERRY ]]
  then
    echo "I could not find that element in the database."
  else
    if [[ ! -z $INT_QUERRY ]]
    then
      NUMBER=$($PSQL "SELECT elements.atomic_number FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
      NAME=$($PSQL "SELECT name FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
      SYMBOL=$($PSQL "SELECT symbol FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
      TYPE=$($PSQL "SELECT type FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1")
      MASS=$($PSQL "SELECT atomic_mass FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
      MELT=$($PSQL "SELECT melting_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
      BOIL=$($PSQL "SELECT boiling_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    fi
    if [[ ! -z $SYMBOL_QUERRY ]]
    then
      NUMBER=$($PSQL "SELECT elements.atomic_number FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1'")
      NAME=$($PSQL "SELECT name FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1'")
      SYMBOL=$($PSQL "SELECT symbol FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1'")
      TYPE=$($PSQL "SELECT type FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE symbol='$1'")
      MASS=$($PSQL "SELECT atomic_mass FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1'")
      MELT=$($PSQL "SELECT melting_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1'")
      BOIL=$($PSQL "SELECT boiling_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1'")
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    fi
    if [[ ! -z $NAME_QUERRY ]]
    then
      NUMBER=$($PSQL "SELECT elements.atomic_number FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1'")
      NAME=$($PSQL "SELECT name FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1'")
      SYMBOL=$($PSQL "SELECT symbol FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1'")
      TYPE=$($PSQL "SELECT type FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number FULL JOIN types ON properties.type_id=types.type_id WHERE name='$1'")
      MASS=$($PSQL "SELECT atomic_mass FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1'")
      MELT=$($PSQL "SELECT melting_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1'")
      BOIL=$($PSQL "SELECT boiling_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE name='$1'")
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    fi
  fi
  
fi
#done
