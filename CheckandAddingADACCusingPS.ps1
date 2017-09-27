
#Check The user 
#$Name = 'asdas'
#$File = .\Testing
$MachineName = "prtest3"
$User = Get-ADUser -LDAPFilter "(sAMAccountName=($MachineName))"
if ($User -ne $Null){
    
    "User Exist"
        
}
Else {

   try{

    "User does not exist"
    "Creating a New User"
    "Using NewName:" 
    echo $MachineName

            #$MachineName = "AT004"
            $NewUser = $MachineName
            $GName = $MachineName 
            $Sname = $MachineName
            $SAName = $MachineName
            $PUserName = $MachineName 
            #$Encrypasswd = ('Abcd@123456789')
            #$DecryPasswd = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Encrypasswd))

            "Using GivenName:" 
            echo $MachineName
            "Using Surname:" 
            echo $MachineName
            "Using SamAccountName:" 
            echo $MachineName
            "Using UserPrincipleName:" 
            echo $MachineName


            New-ADUser -Name($NewUser) `
            -GivenName($GName) -Surname($Sname) `
            -SamAccountName ($SAName) -UserPrincipalName($PUserName) `
            -AccountPassword(Read-Host -AsSecureString 'Please Key In password') `
            -PassThru | Enable-ADAccount

            #Echo "user Created, adding to manifest file"
            

             ##$File.ServiceComponentPackages.ServiceAccount()
             ##$File.ServiceCompnonentPackages.ServiceAccountPassword()

        }
        catch
        {
            Write-Host $_.Exception.Message -ForegroundColor Yellow
        }
        
            }
          

#$Username = (Read-Host -AsSecureString "Please Key in User Name")
#$hello = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Username))
#$Hari = (Get-credential -UserName  $Username -Message "Enter Password") #-ConfigurationData $configData
#echo $Username "this is the echo" 
#echo $hello
echo "end"