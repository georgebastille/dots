function proxy
   if pgrep openvpn > /dev/null
       set https_proxy (cat ~/.proxy)
   else
       set https_proxy
   end
end

