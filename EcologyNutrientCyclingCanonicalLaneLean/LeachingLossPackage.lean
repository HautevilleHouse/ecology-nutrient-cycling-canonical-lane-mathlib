import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure LeachingLossPackage where
  leachingRate : ℝ
  precipitation : ℝ
  soilPermeability : ℝ
  nitrateConcentration : ℝ

structure LeachingLossEvidence (L : LeachingLossPackage) where
  leachingRateClosed : L.leachingRate > 0
  precipitationClosed : L.precipitation > 0
  soilPermeabilityClosed : L.soilPermeability > 0 ∧ L.soilPermeability < 1
  nitrateConcentrationClosed : L.nitrateConcentration > 0

def LeachingLossClosed (L : LeachingLossPackage) : Prop :=
  L.leachingRate > 0 ∧ L.precipitation > 0 ∧ (L.soilPermeability > 0 ∧ L.soilPermeability < 1) ∧ L.nitrateConcentration > 0

theorem leaching_loss_closed_from_evidence (L : LeachingLossPackage) (E : LeachingLossEvidence L) :
    LeachingLossClosed L := by
  exact And.intro E.leachingRateClosed (And.intro E.precipitationClosed (And.intro E.soilPermeabilityClosed E.nitrateConcentrationClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse