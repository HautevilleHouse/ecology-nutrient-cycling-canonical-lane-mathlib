import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure NutrientPoolPackage where
  poolIdentifier : String
  carbonPool : Prop
  nitrogenPool : Prop
  phosphorusPool : Prop
  transformationRates : Prop

structure NutrientPoolEvidence (P : NutrientPoolPackage) where
  carbonPoolClosed : P.carbonPool
  nitrogenPoolClosed : P.nitrogenPool
  phosphorusPoolClosed : P.phosphorusPool
  transformationRatesClosed : P.transformationRates

def NutrientPoolClosed (P : NutrientPoolPackage) : Prop :=
  P.carbonPool ∧ P.nitrogenPool ∧ P.phosphorusPool ∧ P.transformationRates

theorem nutrient_pool_closed_from_evidence (P : NutrientPoolPackage) (E : NutrientPoolEvidence P) :
    NutrientPoolClosed P := by
  exact And.intro E.carbonPoolClosed
    (And.intro E.nitrogenPoolClosed
      (And.intro E.phosphorusPoolClosed E.transformationRatesClosed))

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse