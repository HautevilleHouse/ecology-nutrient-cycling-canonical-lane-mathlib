import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure NutrientCyclingPackage where
  reservoirSet : Type u
  fluxMatrix : reservoirSet → reservoirSet → Type v
  inputs : reservoirSet → Type w
  outputs : reservoirSet → Type x
  massBalanceLaw : Prop
  conservationClosed : Prop

structure NutrientCyclingEvidence (M : NutrientCyclingPackage) where
  massBalanceLawClosed : M.massBalanceLaw
  conservationClosedClosed : M.conservationClosed

def NutrientCyclingClosed (M : NutrientCyclingPackage) : Prop :=
  M.massBalanceLaw ∧ M.conservationClosed

theorem nutrient_cycling_closed_from_evidence (M : NutrientCyclingPackage)
    (E : NutrientCyclingEvidence M) : NutrientCyclingClosed M := by
  exact And.intro E.massBalanceLawClosed E.conservationClosedClosed

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse