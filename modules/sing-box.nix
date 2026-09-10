{
  # services.resolved.enable = true;# enabled in main networking

  services.sing-box = {
    enable = true;
    settings = {
      log.level = "warn";

      dns = {
        servers = [
          {
            tag = "remote";
            address = "tls://1.1.1.1";
            detour = "proxy";
          }
        ];
        final = "remote";
      };

      inbounds = [
        {
          type = "tun";
          tag = "tun-in";
          interface_name = "tun0";
          address = [
            "172.19.0.1/30"
            "fdfe:dcba:9876::1/126"
          ];
          mtu = 9000;
          auto_route = true;
          strict_route = true;
          dns_mode = "hijack";
          stack = "system";
        }
      ];

      outbounds = [
        {
          type = "vless";
          tag = "proxy";
          server = "144.31.52.195";
          server_port = 443;
          uuid = "14be8fc3-b85b-4c21-85bb-b56cb412aef7";
          tls = {
            enabled = true;
            server_name = "sun6-22.userapi.com";
            utls = {
              enabled = true;
              fingerprint = "chrome";
            };
            reality = {
              enabled = true;
              public_key = "BATNsAkNwJbD0ISJzy-OyxMee7j-e2bveA-C0eUpNgY";
              short_id = "e5d600b661dc4697";
            };
          };
        }
        {
          type = "direct";
          tag = "direct";
        }
        {
          type = "dns";
          tag = "dns-out";
        }
      ];

      route = {
        auto_detect_interface = true;
        rules = [
          {
            protocol = "dns";
            outbound = "dns-out";
          }
        ];
        final = "proxy";
      };
    };
  };
}
