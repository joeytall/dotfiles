#!/usr/bin/expect

set ip [lindex $argv 0];
set pw [lindex $argv 1];
set jid [lindex $argv 2];

if { $pw == "0" } {
  set pw ""
}

proc connect { ip pw jid } {
  spawn ssh admin@$ip
  expect {
    "(yes/no)?" {
      send "yes\r"
      expect "password"
      send "$pw\r"
      expect "> "
      send "fnsysctl shell\r"
      expect {
        "#" {
          if { $jid != ""} {
            send "cd \`sandbox-jobs-move -p -j$jid\`\r"
          }
        }
        "Username:" {
          send "fsa_support\r"
          expect "Password: "
          send "Support@FSA1\r"
          if { $jid != ""} {
            send "cd \`sandbox-jobs-move -p -j$jid\`\r"
          }
        }
      }
    }
    "password" {
      send "$pw\r"
      expect "> "
      send "fnsysctl shell\r"
      expect {
        "#" {
          if { $jid != ""} {
            send "cd \`sandbox-jobs-move -p -j$jid\`\r"
          }
        }
        "Username:" {
          send "fsa_support\r"
          expect "Password: "
          send "Support@FSA1\r"
          expect "# "
          if { $jid != ""} {
            send "cd \`sandbox-jobs-move -p -j$jid\`\r"
          }
        }
      }
    }
  }
  interact
}


connect $ip $pw $jid
