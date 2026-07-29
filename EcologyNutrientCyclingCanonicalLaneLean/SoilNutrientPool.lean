import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure SoilNutrientPool where
  carbon : ℝ
  nitrogen : ℝ
  phosphorus : ℝ
  ph : ℝ

structure SoilNutrientPoolEvidence (S : SoilNutrientPool) where
  carbonClosed : S.carbon > 0
  nitrogenClosed : S.nitrogen > 0
  phosphorusClosed : S.phosphorus > 0
  phClosed : S.ph > 0 ∧ S.ph < 14

def SoilNutrientPoolClosed (S : SoilNutrientPool) : Prop :=
  S.carbon > 0 ∧ S.nitrogen > 0 ∧ S.phosphorus > 0 ∧ (S.ph > 0 ∧ S.ph < 14)

theorem soil_nutrient_pool_closed_from_evidence (S : SoilNutrientPool) (E : SoilNutrientPoolEvidence S) :
    SoilNutrientPoolClosed S := by
  exact And.intro E.carbonClosed (And.intro E.nitrogenClosed (And.intro E.phosphorusClosed E.phClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse