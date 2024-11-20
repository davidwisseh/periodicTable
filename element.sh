#!/bin/bash
if [[ -z $1 ]]
then 
echo Please provide an element as an argument.
else

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ $1 =~ ^[0-9]+$ ]] 
then
  echo "$($PSQL "SELECT * from elements where atomic_number=$1")" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
  do
  if [[ -z $NAME ]] 
  then
    echo  I could not find that element in the database.
  else
  echo "$($PSQL "SELECT * from properties where atomic_number=$1")" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
  do 
    if [[ $TYPE_ID  == 1 ]]
    then
    echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    else
    if [[ $TYPE_ID == 2 ]]
    then 
    echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a metal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
    else
    echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a mettaloid, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."


    fi
    fi
  done
  fi
  done 
else
SYMBOLRESPONSE=$($PSQL "select * from elements where symbol='$1'")
if [[ -z $SYMBOLRESPONSE ]]
then
NAMERESPONSE=$($PSQL "select * from elements where name='$1'")
if [[ -z $NAMERESPONSE ]]
then
echo I could not find that element in the database.
else
echo $NAMERESPONSE |  while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
  do
 
  if [[ -z $NAME ]] 
  then
    echo  I could not find that element in the database.
  else
  echo "$($PSQL "SELECT * from properties where atomic_number=$ATOMIC_NUMBER")" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
  do 
    if [[ $TYPE_ID  == 1 ]]
    then
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    else
    if [[ $TYPE_ID == 2 ]]
    then 
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a metal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
    else
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a mettaloid, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."


    fi
    fi
  done
  fi
  done 
fi
else
echo $SYMBOLRESPONSE |  while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
  do
 
  if [[ -z $NAME ]] 
  then
    echo  I could not find that element in the database.
  else
  echo "$($PSQL "SELECT * from properties where atomic_number=$ATOMIC_NUMBER")" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
  do 
    if [[ $TYPE_ID  == 1 ]]
    then
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    else
    if [[ $TYPE_ID == 2 ]]
    then 
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a metal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    
    else
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a mettaloid, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."


    fi
    fi
  done
  fi
  done 
fi
fi
fi