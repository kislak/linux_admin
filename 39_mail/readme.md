## smtp, imap, pop3

SMTP
  text file
  envelop
    sender addr
    reciever addr
    other
  message
    mail header
      send, 
      reciever, 
      subject
      date  
    mail body

telnet mail.com 25

mail to: <kislak7@gmail.com>
rcpt to: <kislak7@gmail.com>

DATA
From: sk <kislak7@gmail.com>
To: sk <kislak7@gmail.com>
Subject: xx

hi!
.

-> 250 ok queue as xxx


MTA (mail transfer agent)
  sendmail
  postfix
  qmail
  exim

MDA (mail delivery agent)
  dovecot  
  
LDA (local delivery agent)
  postfix
  dovecot

PTR (ip -> domain)
  // add record in DNS console
  // !should exist: A record (domain -> ip)


MX -> (A rec )
  bind utils
  dig MX yandex.ru
  name only (no ip)

antispam  
  DKIM (domain key identified mail)
    sign mail (not encript)
    publish public key -> DNS 
      hardfun.art IN TXT "t=s\;o=~\;"
      mail.hardfun.art IN TXT "v=DKIM1;k=rsa;p=MIGf******AQAB"
      _adsp.hardfun.art IN TXT "ddkim=all"
  DMARC
    domain-based message auth, reporting and conformance
    inform about DKIM and SPF
    feedback (report stat)
    _dmark TXT "v=DMARK1;p=none;fo=1;rua=mailto:admin@example.com;ruf=mailto:admin@example.com"
    rua - aggregate
    ruf - failed
    p= policy reject
    fo= - fail policiy (report)
    aspf= - mail from the same (in body and header) 
  SPF
    sender policy framework (servers can sand mail from your domain)
    @ IN TXT "v=spf1 ip4:1.1.1.1 a mx include:_spf.google.com ~all"


spam
  bot
  open server
  zombi server
  ipmi
  account hacked
  ticket system
    reply to each mail 
      "thank you for for your mail! we are working on it..."


postfix
  postfix admin - web

dovecod

