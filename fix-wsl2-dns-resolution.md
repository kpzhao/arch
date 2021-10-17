More recent resolution:

1. cd ~/../../etc (go to etc folder in WSL).
2. echo "[network]" | sudo tee wsl.conf (Create wsl.conf file and add the first line).
3. echo "generateResolvConf = false" | sudo tee -a wsl.conf (Append wsl.conf the next line).
4. wsl --terminate Debian (Terminate WSL in Windows cmd, in case is Ubuntu not Debian).
5. cd ~/../../etc (go to etc folder in WSL).
6. sudo rm -Rf resolv.conf (Delete the resolv.conf file).
7. In windows cmd, ps or terminal with the vpn connected do: Get-NetIPInterface or ipconfig /all for get the dns primary and
secondary.
8. With the dns primary and secondary getted replace the numbers in the next step in the X.X.X.X
9. echo "nameserver X.X.X.X" | sudo tee resolv.conf (Create resolv.conf and append the line.)
10. echo "nameserver X.X.X.X" | sudo tee -a resolv.conf (Append the line in resolv.conf)
11. wsl --terminate Debian (Terminate WSL in Windows cmd, in case is Ubuntu not Debian).
12. sudo chattr +i resolv.conf
13. And finally in windows cmd, ps or terminal:
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000

Credit: @MartinCaccia, @yukosgiti, @machuu and @AlbesK:
https://github.com/microsoft/WSL/issues/4277
https://github.com/microsoft/WSL/issues/4246

---

Original resoltuion:

1. Create a file: /etc/wsl.conf.
2. Put the following lines in the file in order to ensure the your DNS changes do not get blown away

[network]
generateResolvConf = false

3. In a cmd window, run wsl --shutdown
4. Restart WSL2
5. Create a file: /etc/resolv.conf. If it exists, replace existing one with this new file.
6. Put the following line in the file

nameserver 8.8.8.8 # Or use your DNS server instead of 8.8.8.8 which is a Google DNS server

7. Repeat step 3 and 4. You will see git working fine now.

Credit: https://github.com/microsoft/WSL/issues/4285#issuecomment-522201021
