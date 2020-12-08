## ldap

IMS - identity management issues 

LDAP. Централизованная авторизация и аутентификация

AAA, NSS, LDAP

ldap
  Lightweight Directory Access Protocol
    - protocole
    - directory structure 
    - language 
  X.500-lite
  389ds
  microsoft active directory

  nis - network information service
    nis domain
  radius

  tcp port 389 (ssl/tls 636)
  
  kerberos (auth system)

dn - distinguished name (uniq, fqdn) cn,ou,dc (от листа до корня)
  cn - common name - fio/role
  ou - organizational unit
  dc - domain name

dn: cn=Serge Kislak,ou=engineers,dc=freshly

tools
  Apache Directory Studio
  ldapvi

ldap schema
  dn: cn=schema
  RFC2307BIS

pam 
  pluggable authentication modules

ipa
  Identity, Policy, Audit

glibc
  gethostbynam() /etc/hosts
  getpwnam() /etc/passwd -> get uid
  /etc/nsswitch (define host lookup order: files(etc/hosts), dns, myhostname(localhost, interface))

freeIPA
  ladp
  kerberos
  bind
  web console
  
  yum install ipa-server
  
sssd
  /etc/sssd/sssd.conf

OpenLDAP client (sssd works with openLDAP)
  /etc/openldap/ldap.conf
