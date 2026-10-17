function dirac --wraps dirac
    # Provider and model live in ~/.dirac/data/globalState.json (local gateway profile).
    set -lx DIRAC_NO_AUTO_UPDATE 1
    command dirac --yolo $argv
end
