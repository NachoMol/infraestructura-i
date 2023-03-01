$req = Invoke-WebRequest -Method Get -Uri https://raw.githubusercontent.com/olea/lemarios/master/nombres-propios-es.txt
$nombresConA = $req.Content.split("`n") | Where-Object { $_ -like "A*" }
$nombresConL = $req.Content.split("`n") | Where-Object { $_ -like "L*" }

1..5 | ForEach-Object {
  $random = Get-Random -Minimum 0 -Maximum $($nombresConA.count-1)
  $nombre = $nombresConA[$random]
  $gender = Invoke-RestMethod -Method Get -Uri https://api.genderize.io/?name=$nombre | Select-Object -ExpandProperty Gender
  $country = Invoke-RestMethod -Method Get -Uri https://api.nationalize.io/?name=$nombre | Select-Object -ExpandProperty Country | Select-Object -First 1 -Property country_id
  write-output "El género probable de $nombre es $gender"
}

1..5 | ForEach-Object {
  $random = Get-Random -Minimum 0 -Maximum $($nombresConL.count-1)
  $nombre = $nombresConL[$random]
  $gender = Invoke-RestMethod -Method Get -Uri https://api.genderize.io/?name=$nombre | Select-Object -ExpandProperty Gender
  $country = Invoke-RestMethod -Method Get -Uri https://api.nationalize.io/?name=$nombre | Select-Object -ExpandProperty Country | Select-Object -First 1 -Property country_id
  write-output "El género probable de $nombre es $gender"
}

