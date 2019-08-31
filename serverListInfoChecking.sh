outputFile='output.txt'

echo > $outputFile
echo start checking! >> $outputFile

input="./ipAddrList.txt"
while IFS= read -r ip
do
    echo ********$ip********
    echo ********$ip******** >> $outputFile

    ssh -T -i ~/.ssh/key.pem user_name@$ip >> $outputFile << EOF
echo
echo -------name--------
uname -a
echo
exit
EOF

done < "$input"
