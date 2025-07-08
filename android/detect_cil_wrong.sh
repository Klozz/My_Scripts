#!/bin/bash

CIL_FILES=(
"out/soong/.intermediates/system/sepolicy/compat/plat_sepolicy_genfs_202504.cil/android_arm64_armv8-2a-dotprod/plat_sepolicy_genfs_202504.cil"
"out/soong/.intermediates/system/sepolicy/plat_sepolicy.cil/android_common/plat_sepolicy.cil"
"out/soong/.intermediates/system/sepolicy/plat_pub_versioned.cil/android_common/lisa/plat_pub_versioned.cil"
"out/soong/.intermediates/system/sepolicy/system_ext_sepolicy.cil/android_common/lisa/system_ext_sepolicy.cil"
"out/soong/.intermediates/system/sepolicy/product_sepolicy.cil/android_common/lisa/product_sepolicy.cil"
"out/soong/.intermediates/system/sepolicy/vendor_sepolicy.cil/android_common/lisa/vendor_sepolicy.cil"
"out/soong/.intermediates/system/sepolicy/odm_sepolicy.cil/android_common/lisa/odm_sepolicy.cil"
"out/soong/.intermediates/system/sepolicy/plat_mapping_file/android_common/202504.cil"
"out/soong/.intermediates/system/sepolicy/system_ext_mapping_file/android_common/lisa/202504.cil"
"out/soong/.intermediates/system/sepolicy/product_mapping_file/android_common/lisa/202504.cil"
)

echo "==> Probando compilación incremental de .cil"
for ((i=1; i<=${#CIL_FILES[@]}; i++)); do
  echo ""
  echo "==> Probando ${i} archivos:"
  "${CIL_FILES[@]:0:$i}"
  out/host/linux-x86/bin/secilc -m -M true -G -c 30 \
    "${CIL_FILES[@]:0:$i}" \
    -o /tmp/test_policy \
    -f /dev/null -N 2>&1 | tee test_${i}.log

  if grep -q "Failed to compile" "test_${i}.log"; then
    echo "⚠️  Falló en el archivo #$i: ${CIL_FILES[$((i-1))]}"
    break
  else
    echo "✅ Compilación OK con los primeros $i archivos"
  fi
done
