$joltage = Get-Content -Path "C:\temp\data.txt"
$sum = 0

function Get-Maxdigits ($string, $n){
    if ($n -eq 0){ return "" }

    $maxdigit = -1
    $maxpos = 0
    for ($i = 0; $i -le $string.Length - $n; $i++) {
        $digit = [int]::Parse($string[$i])
        if ($digit -gt $maxdigit) {
            $maxdigit = $digit
            $maxpos = $i
        }
    }
    return "$maxDigit$(Get-MaxDigits $string.Substring($maxPos + 1) ($n - 1))"
}
foreach ($jolt in $joltage) {
    $max_joltage = Get-maxdigits $jolt 12
    $sum += $max_joltage
}

$sum
