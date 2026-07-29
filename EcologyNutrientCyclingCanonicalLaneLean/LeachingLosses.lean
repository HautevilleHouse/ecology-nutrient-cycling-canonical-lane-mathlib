import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure LeachingPackage where
  soilLayerSet : Type u
  nutrientSpecies : Type v
  leachingRate : soilLayerSet → nutrientSpecies → ℚ
  waterFlux : soilLayerSet → ℚ
  percolationDepth : ℕ
  groundwaterRecharge : ℚ

structure LeachingEvidence (L : LeachingPackage) where
  leachingRatePositive : ∀ (s : L.soilLayerSet) (n : L.nutrientSpecies), L.leachingRate s n > 0
  groundwaterRechargeClosed : L.groundwaterRecharge = 0.3

def LeachingClosed (L : LeachingPackage) : Prop :=
  (∀ (s : L.soilLayerSet) (n : L.nutrientSpecies), L.leachingRate s n > 0) ∧
  L.groundwaterRecharge = 0.3

theorem leaching_closed_from_evidence (L : LeachingPackage)
    (E : LeachingEvidence L) : LeachingClosed L := by
  exact And.intro E.leachingRatePositive E.groundwaterRechargeClosed

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse