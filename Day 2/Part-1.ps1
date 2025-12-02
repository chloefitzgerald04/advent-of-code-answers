# Fetch nums as "1-2" format
$ids = @((get-content -path "C:\Temp\aoc2.csv" -delimiter ",").replace(",",""))
$invalididsum = 0

#loop through each "1-2" pair
foreach($id in $ids){
    #Split "1-2" into range "1" to "2". Had to adapt for big integers as some were large
    for($num = ([int64]$id.split("-")[0]); $num -le ([int64]$id.split("-")[1]); $num++){
        #convert to string to split into half. odd number length strings will never be invalid. leading "0"s will be removed by converting to int anyway
        $numstring = "$num"
        $mid = [math]::Floor($numstring.Length / 2)
        
        $left  = $numstring.Substring(0, $mid)
        $right = $numstring.Substring($mid)
        #compare left to right - if match then invalid and add to total
        if ($left -eq $right){
            Write-host "Invalid ID $left$right"
            $global:invalididsum += $num

        }
         
    }

} 
$invalididsum

54641809925
