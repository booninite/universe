let
  sources = import <u/nix/sources.nix>;
in
{
  meta = {
    name = "homestar2";
    description = "shimmerjs k3s cluster orchestrated by his nixos godbox";
    nixpkgs = import <u/nix> { inherit sources; };
  };

  defaults = { pkgs, name, ... }: {
    deployment = {
      # otherwise colmena will attempt to use root, which we dont like
      # TODO: docs indicate it should use active user, maybe updating colmena 
      #       will fix
      targetUser = "shimmerjs";
    };

    networking.hostName = name;
  };

  # hive control center
  herq = { pkgs, ... }: {
    deployment = {
      tags = [ "queen" ];
      allowLocalDeployment = true;
    };

    imports = [ ./machines/herq ];
  };

  rehab = { pkgs, nodes, ... }: {
    deployment.tags = [ "k3s-server" ];
    imports = [ ./machines/rehab ];
  };

  slugger = { pkgs, nodes, ... }: {
    deployment.tags = [ "rpi" "k3s-agent" ];
    imports = [ <u/modules/rpi/k3s-agent.nix> ];
    services.k3s-agent.ip = "100.65.65.64";
  };

  snake = { pkgs, nodes, ... }: {
    deployment.tags = [ "rpi" "k3s-agent" ];
    imports = [ <u/modules/rpi/k3s-agent.nix> ];
    services.k3s-agent.ip = "100.115.61.75";
  };

  eloise = { pkgs, nodes, ... }: {
    deployment.tags = [ "rpi" "k3s-agent" ];
    imports = [ <u/modules/rpi/k3s-agent.nix> ];
    services.k3s-agent.ip = "100.105.232.41";
  };

  # creep = { pkgs, nodes, ... }: {
  #   deployment.tags = [ "rpi" ];
  #   imports = [ <u/modules/rpi/k3s-agent.nix> ];
  #   services.k3s-agent.ip = "100.126.139.25";
  # };

  bishop = { pkgs, nodes, ... }: {
    deployment.tags = [ "rpi" "k3s-agent" ];
    imports = [ <u/modules/rpi/k3s-agent.nix> ];
    services.k3s-agent.ip = "100.77.146.43";
  };
}
