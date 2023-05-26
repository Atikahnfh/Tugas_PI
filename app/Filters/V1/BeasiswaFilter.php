<?php

namespace App\Filters\V1;

use Illuminate\Http\Request;
use App\Filters\ApiFilter;

class BeasiswaFilter extends ApiFilter{
    protected $allowedParms = [
        'idBeasiswa' => ['eq'],
        'namaBeasiswa' => ['eq'],
        'idMitra' => ['eq'],
        'angkatanAwal' => ['gt', 'lt', 'eq','gte','lte'],
        'angkatanAkhir' => ['gt', 'lt','eq', 'gte', 'lte'],
        'semMin'=> ['gt', 'lt','eq'],
        'semMax'=> ['gt', 'lt','eq'],
        'status'=> ['eq']
    ];

    protected $columnMap = [
        'idBeasiswa' => 'id',
        'angkatanAwal' => 'angkatan_awal',
        'angkatanAkhir' => 'angkatan_akhir',
        'semMin'=> 'sem_min',
        'semMax' => 'sem_max',
        'namaBeasiswa' => 'nama_beasiswa',
        'idMitra' => 'id_mitra',
        'status' => 'status'
    ];

    protected $operatorMap = [
        'eq' => '=',
        'lt' => '<',
        'lte'=> '<=',
        'gt' => '>',
        'gte' => '>='
    ];

    public function transform(Request $request) {
        $eloQuery = [];

        foreach($this->allowedParms as $parm => $operators) {
            $query = $request->query($parm);

            if(!isset($query)){
                continue;
            }

            $column = $this->columnMap[$parm] ?? $parm;

            foreach ($operators as $operator){
                if(isset($query[$operator])){
                    $eloQuery[] = [$column, $this->operatorMap[$operator], $query[$operator]];
                }
            }
        }

        return $eloQuery;
    }

}