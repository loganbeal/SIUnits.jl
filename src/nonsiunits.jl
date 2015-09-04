export ElectronVolt, Torr, Atmosphere, Degree, Foot, Gallon, Ounce, Pound, Btu

const ElectronVolt = NonSIUnit{typeof(Joule),:eV}()
convert(::Type{SIQuantity},::typeof(ElectronVolt)) = 1.60217656535e-19Joule

const Torr = NonSIUnit{typeof(Pascal),:torr}()
convert(::Type{SIQuantity},::typeof(Torr)) = 133.322368Pascal

const Atmosphere = NonSIUnit{typeof(Pascal),:atm}()
convert(::Type{SIQuantity},::typeof(Atmosphere)) = 101325Pascal

const Degree = NonSIUnit{typeof(Radian),:deg}()
convert(::Type{SIQuantity},::typeof(Degree)) = π/180.*Radian

for (func,funcd) in ((:sin,:sind),
                     (:cos,:cosd),
                     (:tan,:tand),
                     (:cot,:cotd),
                     (:sec,:secd),
                     (:csc,:cscd))
    @eval $func{T}(θ::NonSIQuantity{T,$(typeof(Degree))}) = $funcd(θ.val)
end

const Foot = NonSIUnit{typeof(Meter),:ft}()
convert(::Type{SIQuantity},::typeof(Foot)) = 0.3048*Meter 

#const Inch = NonSIUnit{typeof(Meter),:in}()
#convert(::Type{SIQuantity},::typeof(Inch)) = 0.3048/12*Meter 

#const Yard = NonSIUnit{typeof(Meter),:yd}()
#convert(::Type{SIQuantity},::typeof(Yard)) = 0.3048*3*Meter 

const Gallon = NonSIUnit{typeof(Liter),:gal}()
convert(::Type{SIQuantity},::typeof(Gallon)) = 3.785412*Liter

#const Quart = NonSIUnit{typeof(Liter),:qt}()
#convert(::Type{SIQuantity},::typeof(Quart)) = 3.785412/4*Liter

#const Cup = NonSIUnit{typeof(Liter),:cup}()
#convert(::Type{SIQuantity},::typeof(Cup)) = 3.785412/16*Liter

const Ounce = NonSIUnit{typeof(Liter),:oz}()
convert(::Type{SIQuantity},::typeof(Ounce)) = 29.57353/1000*Liter

const Pound = NonSIUnit{typeof(KiloGram),:lbs}()
convert(::Type{SIQuantity},::typeof(Pound)) = 0.453592*KiloGram

const Btu = NonSIUnit{typeof(Joule),:btu}()
convert(::Type{SIQuantity},::typeof(Btu)) = 1055.056*Joule
