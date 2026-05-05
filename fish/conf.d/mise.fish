function __mise_auto
    if type -q mise
        if test -f .mise.toml -o -f .tool-versions
            if not set -q __mise_initialized
                set -g __mise_initialized 1
                mise activate fish | source
            end
        end
    end
end

function cd
    builtin cd $argv
    __mise_auto
end

__mise_auto
