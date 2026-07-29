import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure EcosystemObject where
  ecosystem : Type
  nutrientCyclingComplete : Prop
  conclusion : nutrientCyclingComplete

structure NutrientCyclingWitnessClosed (O : EcosystemObject) : Prop where
  witness : O.nutrientCyclingComplete

def ConstrainedNutrientCyclingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_nutrient_cycling_endgame (A : AdmissibleClass) :
    ConstrainedNutrientCyclingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse