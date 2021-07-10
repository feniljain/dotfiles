require("harpoon").setup({
    projects = {
        -- ["/home/fenil/Projects/Learn/dsa/topics/bst"] = {
        --     term = {
        --         cmds = {
        --             "g++ *.cpp && ./a.out\n",
        --         }
        --     }
        -- },
        -- ["/home/fenil/Projects/Learn/Go/appointy/deployment"] = {
        --     term = {
        --         cmds = {
        --             "saastack backend run\n",
        --             "saastack backend install && saastack backend run\n",
        --             "go mod tidy\n",
        --             "go mod download\n",
        --         }
        --     }
        -- },
        -- ["/home/fenil/Projects/Learn/Go/appointy/services/ical"] = {
        --     term = {
        --         cmds = {
        --             "saastack backend proto compile ./pb\n",
        --             "saastack backend create -i ./pb -o ./ -p icals -m go.saastack.io/ical\n",
        --             "go mod tidy\n",
        --             "go mod download\n",
        --         }
        --     }
        -- },
        ["/home/feniljain/Projects/golang-projects/appointy/paypaltest/"] = {
            term = {
                cmds = {
                    "go run main.go\n",
                    "go mod tidy\n",
                    "go mod download\n",
                    "go build ./...\n",
                }
            }
        }
    }
})
