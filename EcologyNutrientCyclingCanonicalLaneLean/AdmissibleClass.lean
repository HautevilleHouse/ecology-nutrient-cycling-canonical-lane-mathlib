import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure AdmissibleClass where
  ecosystem : EcosystemObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NutrientCyclingWitnessClosed A.ecosystem ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse