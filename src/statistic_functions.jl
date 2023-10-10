#---
function rse_sum(x)
    +(x...)
end

rse_sum(1:36) == 666

#---
function rse_mean(x)
    rse_sum(x)/length(x)
end

rse_mean(-15:17) == 1

#---
function rse_std(x)
    sqrt(sum((x.-rse_mean(x)).^2) /(length(x)-1))
end

rse_std(1:3)

#---
function rse_tstat(x; σ = rse_std(x))
    rse_mean(x)/ (σ / sqrt(length(x)))
end

rse_tstat(2:3)
rse_tstat(2:3, σ = 4)

# ---

struct StatResult2
    x::Vector
    n::Int64
    std::Float64
    tvalue::Float64
end

function  StatResult2(x)
    n = length(x)
    std = rse_std(x)
    tvalue = rse_tstat(x)
    return StatResult2(x, n, std, tvalue)
end

StatResult2(2:10)

import Base.length
function length(x::StatResult2)
    return x.n
end

length(StatResult2(2:15))

#---

function printOwner()
    println("My GitHub user name is: emanuel-kopp")
    print("WATCHOUT: this package has been invaded")
end
