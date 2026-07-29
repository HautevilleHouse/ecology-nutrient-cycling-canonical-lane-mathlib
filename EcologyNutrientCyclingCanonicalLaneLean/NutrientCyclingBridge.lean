import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure NutrientCyclingAdmissibleObject where
  ecosystem : String
  nutrientFluxClosed : Prop
  stoichiometricBalanceClosed : Prop

def nutrientCyclingBridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | NutrientCyclingAdmissibleObject.mk _ fluxClosed balanceClosed => fluxClosed ∧ balanceClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    nutrientCyclingBridgeClosed A := by
  unfold nutrientCyclingBridgeClosed
  rcases A.object with ⟨ecosystem, fluxClosed, balanceClosed⟩
  exact And.intro fluxClosed balanceClosed

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse
