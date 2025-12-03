$ids = @((get-content -path "C:\Temp\aoc2.csv" -delimiter ",").replace(",",""))
$invalididsum = 0


foreach($id in $ids){
    for($num = ([int64]$id.split("-")[0]); $num -le ([int64]$id.split("-")[1]); $num++){
        #Regex catches any repeating string
        if ($num.ToString() -match '^(.+)\1+$') {
            $invalididsum += $num
        }
    }

} 
$invalididsum
