$ids = @((get-content -path "C:\Temp\data.csv" -delimiter ",").replace(",",""))
$invalididsum = 0


foreach($id in $ids){
    for($num = ([int64]$id.split("-")[0]); $num -le ([int64]$id.split("-")[1]); $num++){
        $numstring = "$num"
        #Regex catches any repeating string
        if ($numstring -match '^(.+)\1+$') {
            $repeating = $matches[1]
            $global:invalididsum += $num
        }
    }

} 
$invalididsum
