# This script sets up a couple of computational constants
# according to the used number type Numtype

# will be used within operators
const one_over_dx = Numtype(1/dx)
const zeero = Numtype(0.)

const α = Numtype(lbc)
const minus_α = Numtype(-lbc)
const one_minus_α_half = Numtype(1-0.5*lbc)
const one_over_dx_α = Numtype(lbc/dx)
const one_half = Numtype(0.5)
const one_quarter = Numtype(0.25)
const minus_four = Numtype(-4.)
const minus_three_minus_α = Numtype(-3-lbc)

# will be used in the RHS
const g = Numtype(gravity)
const H = Numtype(water_depth)