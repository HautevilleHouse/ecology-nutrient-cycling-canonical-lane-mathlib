import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure LeachingLossPackage where
  solubility : Prop
  waterFlow : Prop
  soilRetention : Prop
  leachingRate : Prop

structure LeachingLossEvidence (L : LeachingLossPackage) where
  solubilityClosed : L.solubility
  waterFlowClosed : L.waterFlow
  soilRetentionClosed : L.soilRetention
  leachingRateClosed : L.leachingRate

def LeachingLossClosed (L : LeachingLossPackage) : Prop :=
  L.solubility ∧ L.waterFlow ∧ L.soilRetention ∧ L.leachingRate

theorem leaching_loss_closed_from_evidence (L : LeachingLossPackage) (E : LeachingLossEvidence L) :
    LeachingLossClosed L := by
  exact And.intro E.solubilityClosed
    (And.intro E.waterFlowClosed
      (And.intro E.soilRetentionClosed E.leachingRateClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse