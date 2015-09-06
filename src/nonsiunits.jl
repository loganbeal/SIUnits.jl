export Degree

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

