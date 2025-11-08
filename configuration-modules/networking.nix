{ ... }:

{
  hardware.bluetooth.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless = {
    enable = true;  # Enables wireless support via wpa_supplicant.
    secretsFile = "/home/yuri/nixos-config/secrets/wifi-secrets-file";
    interfaces = [ "wlp60s0" ];
    driver = "wext,nl80211";
    networks = {
      INTERNET_WIRLESS_5G.pskRaw = "ext:psk_home";
      Redmi8.pskRaw = "ext:psk_mobile";
      Moscow_WiFi_Free.pskRaw = null;
      bmstu_wifi = {
        auth = ''
          scan_ssid=1
          proto=WPA2
          pairwise=CCMP
          key_mgmt=WPA-EAP
          eap=PEAP
          identity="ext:log_bmstu"
          password="ext:psk_bmstu"
          phase1="peaplabel=0"
          phase2="auth=MSCHAPV2"
        '';
      };
    };
  };
  services.zapret = {
    enable = true;
    params = [
      "--filter-tcp=80 ˂HOSTLIST˃"
      "--dpi-desync=fake,fakedsplit"
      "--dpi-desync-autottl=2"
      "--dpi-desync-fooling=md5sig"
      "--new"
      "--filter-tcp=443"
      "--dpi-desync=fake,multidisorder"
      "--dpi-desync-fooling=badseq"
      "--dpi-desync-split-pos=midsld"
      "--dpi-desync-fake-tls=0x00000000"
    ];
    whitelist = [
      "discord.com"
      "googleusercontent.com"
      "accounts.google.com"
      "googleadservices.com"
      "googlevideo.com"
      "gvt1.com"
      "jnn-pa.googleapis.com"
      "play.google.com"
      "wide-youtube.l.google.com"
      "youtu.be"
      "youtube-nocookie.com"
      "youtube-ui.l.google.com"
      "youtube.com"
      "youtube.googleapis.com"
      "youtubeembeddedplayer.googleapis.com"
      "youtubei.googleapis.com"
      "yt-video-upload.l.google.com"
      "yt.be"
      "ytimg.com"
      "ggpht.com"
      "hentai0day.com"
    ];
  };
}
