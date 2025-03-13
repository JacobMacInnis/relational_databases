#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon ~~~~~\n"
#You should display a numbered list of the services you offer before the first prompt for input, 
#each with the format #) <service>. For example, 1) cut, where 1 is the service_id

READ_SERVICES() {
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "How may I help you?" 
  echo -e "\nPick a service"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}


MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  READ_SERVICES
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "That is not a valid service number."
    return 
  fi

  VALID_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $VALID_SERVICE ]]
  then 
    MAIN_MENU "That is not a valid service number."
    return 
  fi

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    #insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo -e "\nWhat time did you want to come in?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  if [[ ! -z $INSERT_APPOINTMENT_RESULT ]] 
  then
    echo -e "\nI have put you down for a $VALID_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
