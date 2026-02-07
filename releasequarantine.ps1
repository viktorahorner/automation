Get-QuarantineMessage -QuarantineTypes HighConfPhis  -Direction Inbound -Domain chainiq.com -SenderAddress *@chainiq.com | Release-QuarantineMessage -ReleaseToAll -Verbose -WhatIf
Get-QuarantineMessage -QuarantineTypes Phish  -Direction Inbound -Domain chainiq.com -SenderAddress *@chainiq.com | Release-QuarantineMessage -ReleaseToAll -Verbose -WhatIf
