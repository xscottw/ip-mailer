# ip-mailer
simple script to send you an e-mail if your ip changes
so for this to work you should have a mail client installed, I think I used the one in my arch install by default something like MTA or simple MTA and also ca-certificates need to be installed if not already.
then you need to touch ~/.msmtprc 
inside msmtprc you should have something like this (it may change depending on e-mail provider so you might have to search a bit here is gmails)


account default

auth on
host smtp.gmail.com
protocol smtp
auth on
tls on
tls_starttls on
tls_certcheck on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
from email@domain.com
user email@domain.com
password password



The user configuration file must be explicitly readable/writeable by its owner or msmtp will fail:

chmod 600 ~/.msmtprc

By default your password at the end is stored in plaintext, so I recommend using a throw away account or reading more into password management and passwordeval on the arch wiki for ways to encrypt if necasarry.
https://wiki.archlinux.org/index.php/msmtp#Password_management

you can test your e-mail configuration by typing in the terminal
this will send a test email with subject testbug and empty body to your email.

mail -s "Testbug" </dev/null "email@domain.com" 


more info on msmtp can be found here
https://wiki.archlinux.org/index.php/msmtp#Password_management
