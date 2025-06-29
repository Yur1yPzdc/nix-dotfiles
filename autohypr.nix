{config, pkgs, lib, ...}:
 
 let
   cfg = config.services.ircClient;
 in
 
 with lib;
 
 {
   options = {
     services.ircClient = {
       enable = mkOption {
         default = false;
         type = with types; bool;
         description = ''
           Start an irc client for a user.
         '';
       };
 
       user = mkOption {
         default = "username";
         type = with types; uniq string;
         description = ''
           Name of the user.
         '';
       };
     };
   };
 
   config = mkIf cfg.enable {
     systemd.services.ircSession = {
       wantedBy = [ "multi-user.target" ]; 
       after = [ "network.target" ];
       description = "Start the irc client of username.";
       serviceConfig = {
         Type = "forking";
         User = "${cfg.user}";
         ExecStart = ''${pkgs.screen}/bin/screen -dmS irc ${pkgs.irssi}/bin/irssi'';         
         ExecStop = ''${pkgs.screen}/bin/screen -S irc -X quit'';
       };
     };
 
     environment.systemPackages = [ pkgs.screen ];
   };
 }

