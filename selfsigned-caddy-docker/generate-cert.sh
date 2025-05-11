#!/bin/bash

DOMAINS=("localhost")
IPS=("127.0.0.1" "::1" "192.168.31.1" "2001:db8::1")
CERT_DIR="./certs"
KEY_FILE="$CERT_DIR/selfsigned.key"
CERT_FILE="$CERT_DIR/selfsigned.crt"
PEM_FILE="$CERT_DIR/selfsigned.pem"
DAYS_VALID=825

mkdir -p "$CERT_DIR"

EXTFILE="$CERT_DIR/openssl-san.cnf"
{
  echo "[req]"
  echo "distinguished_name=req"
  echo "req_extensions=v3_req"
  echo "[v3_req]"
  SAN_LIST=""
  for i in "${!DOMAINS[@]}"; do
    [[ $i -gt 0 ]] && SAN_LIST+=","
    SAN_LIST+="DNS:${DOMAINS[$i]}"
  done
  for i in "${!IPS[@]}"; do
    [[ $SAN_LIST != "" ]] && SAN_LIST+=","
    SAN_LIST+="IP:${IPS[$i]}"
  done
  echo "subjectAltName=$SAN_LIST"
} > "$EXTFILE"

openssl req -x509 -nodes -newkey rsa:2048 \
    -days "$DAYS_VALID" \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -subj "/C=CN/ST=Dev/L=Dev/O=Org/OU=Org/CN=${DOMAINS[0]}" \
    -extensions v3_req -config "$EXTFILE"

cat "$KEY_FILE" "$CERT_FILE" > "$PEM_FILE"
echo "✅ 证书生成完成：$CERT_FILE + $KEY_FILE"
